Alerter.setup do |config|

  #Configures the default from for emails sent for Messages
  config.default_from = "no-reply@kudoso.com"

  #Configures the default subject line (only used in emails)
  config.default_subject = "Kudoso: you have a new message!"

  #Configures the methods needed by alerter to get information about the model its attached to
  #config.email_method = :email
  #config.name_method = :name

  #Configures the array of available (supported) notification methods
  # Available choices are: none email push sms twitter
  config.available_notification_methods = %w( none email ios_push android_push sms twitter )

  config.notification_method = %w( none email ios_push android_push sms twitter )

  config.available_notification_types = %w( info warning error action )

  #Configures maximum length of the message
  config.short_msg_length = 144 # twitter support
  config.long_msg_length = 2048

  # Base application URL - to be used in messages
  config.root_url = 'www.kudoso.com'
end

if Alerter::NotificationType.all.count == 0
  Alerter::NotificationType.create(name: 'info')
end