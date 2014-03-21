docker
======

Set up Docker:

Build the VM's
  
  Run from postgres
    `docker build . -t 'grubdice/postgres'`
  
  Run from grubdice
    `docker build . -t 'grubdice/grubdice'`
    

Run the VM's
  `docker run -d --name postgres grubdice/postgres`
  `docker run -d --link postgres:db --name grubdice -p 80 grubdice/grubdice`
