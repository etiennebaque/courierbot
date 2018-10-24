namespace :courierbot do
  task reset_db: :environment do
    User.destroy_all
    Message.destroy_all
  end
end
