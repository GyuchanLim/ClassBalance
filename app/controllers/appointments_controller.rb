class AppointmentsController < ApplicationController
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

    # TODO - Functionality
    # Allow adding of clients from create method
    if @appointment.save
      redirect_to @appointment
    else
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

  private

  def appointment_params
    params.expect(appointment: [ :time ])
  end
end
