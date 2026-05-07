
# Vet Clinic - Lab 7

Rails application for managing pets, owners, vets, appointments, and treatments.

This project includes:

- Active Storage for pet photo uploads
- Image variants and resizing
- Action Text for rich clinical notes
- Bootstrap responsive UI
- N+1 query optimizations

---

# Requirements

- Ruby 3.x
- Rails 8.x
- PostgreSQL
- libvips

---

# Setup Instructions

Clone the repository:

```bash
git clone <repository_url>
cd vet_clinic
````

Install gems:

```bash
bundle install
```

Install database:

```bash
bin/rails db:create db:migrate db:seed
```

Run the server:

```bash
bin/dev
```

Open:

```text
http://localhost:3000
```

---

# Active Storage

This project uses Active Storage for pet photo uploads.

Installed with:

```bash
bin/rails active_storage:install
```

---

# Action Text

This project uses Action Text for rich clinical notes in treatments.

Installed with:

```bash
bin/rails action_text:install
```

---

# Image Processing

This project uses the `image_processing` gem and `libvips` for image variants.

Install libvips:

## Ubuntu / WSL

```bash
sudo apt install libvips
```

## Windows

```bash
winget install libvips
```

---

# Features

## Pets

* Upload pet photos
* Image previews
* Image validation
* Responsive image thumbnails

## Treatments

* Rich text clinical notes
* Formatted medical content
* HTML sanitization

## Performance

* N+1 query fixes using `includes`

---

# Seed Data

The project includes sample:

* Owners
* Pets
* Vets
* Appointments
* Treatments
* Pet photos
* Rich text clinical notes

Run:

```bash
bin/rails db:seed
```

---

# Technologies Used

* Ruby on Rails 8
* PostgreSQL
* Bootstrap 5
* Active Storage
* Action Text
* Turbo
* Stimulus

```
```
