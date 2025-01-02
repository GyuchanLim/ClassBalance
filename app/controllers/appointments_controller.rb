class AppointmentsController < ApplicationController
  before_action :active_client_list, only: [ :new, :create ]
  before_action :client_appointment, only: [ :modify_appointment, :remove_appointment ]

  # TODO - CLEANUP
  # attr_reader :appointment, :client

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
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
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)

    # TODO - Functionality
    # Allow adding of clients from create method
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

  def client_appointment
    @client = Client.find(params[:id])
    @appointment = Appointment.find(params[:appointment_id])
  end

  def active_client_list
    @active_client_list = Client::List.new.fetch_active
  end

  def appointment_params
    params.expect(appointment: [ :time ])
  end

  def submitted_clients
    client_params = params.expect(appointment: [ :client_1, :client_2, :client_3 ])
    client_params.keys.map { |key| client_params[key].blank? ? nil : client_params[key] }.compact.uniq
  end
end
