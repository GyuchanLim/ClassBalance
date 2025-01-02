class AppointmentsController < ApplicationController
  before_action :active_client_list, only: [ :new, :edit ]
  before_action :appointment, only: [ :show, :edit, :update ]
  before_action :enrolled_client_list, only: [ :edit ]
  before_action :client_appointment, only: [ :modify_appointment, :remove_appointment ]

  # TODO - CLEANUP
  # attr_reader :appointment, :client

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
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
  end

  def update
    @appointment.update(appointment_params)
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
    Appointment::ModifyClient.new(@client, @appointment).call
  end

  private

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
    params.expect(appointment: [ :time ])
  end

  def submitted_clients
    client_params = params.expect(appointment: [ :client_1, :client_2, :client_3 ])
    client_params.keys.map { |key| client_params[key].blank? ? nil : client_params[key] }.compact.uniq
  end
end
