# Tags
Tag.find_or_create_by(name: 'Branding & Identities')
Tag.find_or_create_by(name: 'Web & Mobile')
Tag.find_or_create_by(name: 'Illustration')

# Root User
User.create!(
  email: ENV['DEFAULT_EMAIL'],
  password: ENV['DEFAULT_PASSWORD']
)
