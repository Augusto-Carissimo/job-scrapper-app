class PositionMailer < ApplicationMailer
  def update(positions)
    @positions = positions
    mail to: "augusto.carissimo@gmail.com", subject: 'New positions'
  end
end
