class AppointmentsController < ApplicationController
  before_action :active_client_list, only: [ :new, :edit ]
  before_action :appointment, only: [ :show, :edit, :update ]
  before_action :enrolled_client_list, only: [ :edit ]
  before_action :client_appointment, only: [ :modify_appointment, :remove_appointment ]
  before_action :appointment_action, only: [ :new, :edit ]
  before_action :appointment_datetime, only: [ :create, :update ]

  # TODO - CLEANUP
  # attr_reader :appointment, :client

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @client_list = Client::List.new.fetch_active
  end

  def create
    @appointment = Appointment.new(datetime: @appointment_datetime)
    @appointment.enroll(submitted_clients) unless submitted_clients.nil?

    if @appointment.save
      redirect_to @appointment
    else
      # TODO - Usability
      # At the moment it renders new page with no message.
      # Will need to show user why creating appointment failed

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @presenter = AppointmentPresenter.present_appointment(@appointment)
  end

  def update
    @appointment.update(datetime: @appointment_datetime)
    @appointment.enroll(submitted_clients) unless submitted_clients.nil?

    if @appointment.save
      redirect_to @appointment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def remove_appointment
    remove_client_result = Appointment::RemoveClient.new(@client, @appointment).call

    redirect_to @client
  end

  def modify_appointment
    # TODO - FUNCTIONALITY
    # BROKEN PLEASE FIX.
    Appointment::ModifyClient.new(@client, @appointment).call
  end

  private

  def appointment_datetime
    datetime_string = "#{appointment_params['date']} #{appointment_params['hour']}:#{appointment_params['minute']}:00"
    @appointment_datetime = DateTime.parse(datetime_string)

    @appointment_datetime += 12.hours if appointment_params[:am_pm] == "PM"
  end

  def appointment
    @appointment = Appointment.find(params[:id])
  end

  def client_appointment
    @client = Client.find(params[:id])
    @appointment = Appointment.find(params[:appointment_id])
  end

  def active_client_list
    @active_client_list = Client::List.new.fetch_active
  end

  def enrolled_client_list
    @enrolled_client_list = @appointment.clients
  end

  def appointment_params
    params.expect(appointment: [ :date, :hour, :am_pm, :minute ])
  end

  def submitted_clients
    params["appointment"].select { |key, value| key.start_with?("client_") && value.present? }.values
  end

  def appointment_action
    @appointment_action ||= self.action_name
  end
end
