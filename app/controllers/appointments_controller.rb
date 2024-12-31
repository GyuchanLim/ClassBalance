class AppointmentsController < ApplicationController
  before_action :client_list, only: [ :new, :create ]
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
    @appointment.add_clients_to_appointment(cleaned_up_clients_list) unless cleaned_up_clients_list.nil?
    # TODO - Functionality
    # Allow adding of clients from create method
    num_fields = params[:num_fields]  # The selected number of fields
    fields = params.slice(*params.keys.select { |key| key.start_with?('field_') })

    # Process the data as needed
    # For example, logging the fields:
    Rails.logger.info "Number of fields: #{num_fields}"
    Rails.logger.info "Submitted fields: #{fields}"

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

  # TODO - Usablity
  # Allow removal of appointment for a client
  # This may mean changing the name of below method

  # TODO - Functionality
  # Allow removal of appointment
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

  def client_list
    @client_list = Client::List.new.fetch_active
  end

  def appointment_params
    params.expect(appointment: [ :time ])
  end

  def cleaned_up_clients_list
    params.expect(appointment: [ :client_1, :client_2, :client_3 ])
  end
end
