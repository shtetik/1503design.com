# Tags
Tag.find_or_create_by(name: 'Branding & Identities')
Tag.find_or_create_by(name: 'Web & Mobile')
Tag.find_or_create_by(name: 'Illustration')

# Root User
User.create!(
  email: 'ksmirnova.graphics@gmail.com',
  password: ENV['DEFAULT_PASSWORD'],
)
