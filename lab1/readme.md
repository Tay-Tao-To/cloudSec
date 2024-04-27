# Class 2 report
## Step 1: Deploy a EC2 instance allowing SSH access on AWS using terraform.
![](./images/pic1.png)
![](./images/pic2.png)

## Step 2: Connect to instance using putty.
![](./images/pic3.png)

## Step 3: Install Python Setup the environment.
`sudo apt install python 3`
![](./images/pic4.png)

## Step 4: Install Flask.
`pip install flask`
![](./images/pic5.png)

## Step 5: Create hello world web app.
![](./images/pic6.png)

![](./images/pic7.png)

## Step 6: Install and configure nginx as reverse proxy.
![](./images/pic8.png)

### Create a file with the name of the EC2 instance's IP address:
```
 cd /etc/nginx/sites-enabled
 nano "13.228.77.216"
```

### The content inside the file:
```
server {
    listen 80;
    listen [::]:80;
    server_name 13.228.77.216;
        
    location / {
        proxy_pass http://127.0.0.1:5000;
        include proxy_params;
    }
}
```

### Restart Nginx server and check the status of server.
```
sudo systemctl restart nginx
sudo systemctl status nginx
```
![](./images/pic10.png)

## Step 7: Install Python virtual environment and gnuicorn.
```
sudo apt-get install python3-venv -y
pip install wheel
pip install gunicorn
```

## Step 9: Create WSGI Entry Point for Gunicorn.
`~/helloApp$ vim wsgi.py`
```
from hello import app
if __name__ == "__main__":
    app.run()
```

### Activate virtual environment and create entry point for the app:
`source venv/bin/activate`
`~/helloApp$ gunicorn --bind 0.0.0.0:5000 wsgi:app`

## Step 10: Check the result:
![](./images/pic11.png)
![](./images/pic12.png)
![](./images/pic13.png)

