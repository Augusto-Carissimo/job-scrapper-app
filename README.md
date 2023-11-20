# Job Scrapper

## Setup for local development on docker

generate [Gmail application password](https://knowledge.workspace.google.com/kb/how-to-generate-an-app-passwords-000009237)

execute `EDITOR="vim --wait" rails credentials:edit` and add to credentials.yml.enc:
```
google_smtp:
  email: <email>
  password: <application password>
```

execute `sudo docker compose up -d --build`

visit [localhost:3000](http://localhost:3000/)
