# Introduction to Scaling - Adit K
This README file is to introduce users to the most important prt of System design or system architecture - Scaling. We will understand what is Scaling and the types of Scaling using a simple example built by using FastAPI. 

## The example application
We in this tutorial use a very simple hello {name} application built using FastAPI. 

<div align="center">
  <img src="static/Code.png" alt="FastAPI code">
</div>

<b>Example Request: </b>
<div align="center">
  <img src="static/Code_2.png" alt="FastAPI code">
</div>

<b>Example Response: </b>
<div align="center">
  <img src="static/Res.png" alt="Response">
</div>

## Benchmarking Script:
To measure the scaling impact I created a benchmark script:

<div align="center">
  <img src="static/Script.png" alt="script">
</div>

<b>What does this script do basically?</b> 
- Sends 10,000 total requests
- With 1000 concurrent users
- Measures:
  - Requests per second
  - Failed requests
  - Time per request
  - Transfer rate

## Scaling
Scaling is one of the important topics in System design or System architecture.Scaling is a basically a process to increase the System Capacity so it can handle more traffic and work load.
<br> 
As an application grows, the number of users, requests, and data also increases and if the system is not designed in a efficient way (scaled properly), it may cause the application to run slow, crash frequently and also stop working sometimes.

## Client - Server Architecture:
Before we get into scaling and the process of scaling it is important for us to understand how most of the applications work, ie - the Client Server Architecture. 
<br> 
Client - server architecture is basically a 2 way process where:
- The client(Browser / Mobile app or the Frontend) sends a request to the server (Backend)
- The backend recieves the request and in return sends a respoonse.
<br>

<div align="center">
  <img src="static/CS_Arch.png" alt="Client-system architecture">
</div>

<br>
As the nummber of users increase, the server gets more requests, which can cause overload on the server. Scaling helps the server handle more clients without downtime or slow performance.

## Types of Scaling
There are basically 2 types of Scaling methods :
- Vertical Scaling
- Horizontal Scaling
<br>

### Vertical Scaling :
- Vertical scaling is the process of increasing the capacity of a single machine by adding more resources to a single server such as memory, storage etc. 
- It is also known as Scale up approach. 

<div align="center">
  <img src="static/V_S.png" alt="Vertical Scaling">
</div>
<br> 

<u><b>Advantages: </b></u>
- <b>Increased capacity: </b> A server's performance and ability to manage incoming requests can both be enhanced by upgrading its hardware.
- <b>Easier management: </b> Upgrading a single node is usually the focus of vertical scaling, which might be simpler than maintaining several nodes.

<br>

<u><b>Disadvantages: </b></u>
- <b>Limited Scalability: </b> Vertical scaling is constrained by the hardware's physical limitations. Horizontal Scaling is not limited.
- One server still receives all incoming requests thus increasing the possibility of downtime in the event of a server failure.
- Scaling up often requires restarting or replacing the machine, causing downtime.

<br> 

### Vertical Scaling demonstration: 
<b>Step 1: </b> We run the command: uvicorn main:app --reload and then execute the Script.sh script using ./Script. This is the outcome we observe:

<div align="center">
  <img src="static/OP1.png" alt="Output 1">
</div>
<br>

<b>Step 2: </b> Increase workers (vertical scaling). Assuming each laptop has 8 CPU cores, we now run the backend using the command : uvicorn main:app --workers 8 and running the Script again we observe: 

<div align="center">
  <img src="static/OP2.png" alt="Output 2">
</div>

<b>Conclusion: </b> The result is clearly evident and visible. The time taken and the statistics of the time taken for each request to be sent is drastically changed after we increased the workers, ie - Vertical Scaling. 

### Horizontal Scaling :
- Horizontal scaling is a process of increasing the the capacity or performance of an application by adding more machines or servers so the incoming workload or the requests are distributed across a large number of servers.
- It is also known as Scaling out approach. 

<div align="center">
  <img src="static/H_S.png" alt="Horizontal Scaling">
</div>
<br> 

<u><b>Advantages: </b></u>
- <b>Increased capacity: </b> More nodes or instances can handle a larger number of incoming requests.
- <b>Improved performance: </b> By distributing the load over several nodes or instances, it is less likely that any one server will get overloaded.
- <b>Increased fault tolerance: </b> Incoming requests can be sent to another node in the event of a node failure, lowering the possibility of downtime.

<br>

<u><b>Disadvantages: </b></u>
- Requires complex architecture (load balancers, distributed databases, etc.).
- More machines = more networking, power, and maintenance.
- Needs orchestration tools (e.g., Kubernetes, Ansible) to manage many servers.
- Communication between nodes adds latency and complexity.
- Issues can be spread across nodes, making root-cause analysis tricky.

<br> 

### Horizontal Scaling demonstration: 
<b>Step 1: </b> We run the command: uvicorn main:app --reload and then execute the Script.sh script using ./Script. This is the outcome we observe:

<div align="center">
  <img src="static/OP1.png" alt="Output 1">
</div>
<br>

<b>Step 2: </b> Here, we run make 4 different instances using 4 different terminals and run all the 4 instances in 4 different ports (showm below). This basically means we are running are backend using 4 different servers. Now when we have huge workload or a huge number of requests sent to our backend, then the the workload is distributed among all the 4 servers/instances and we get a better result.
<br>
Running our backend in 4 different instances: 
<div align="center">
  <img src="static/HS_Demo.png" alt="HS_Demo">
</div>

<b>Step 3: </b> In horizontal scaling, we need to do one more step, ie - Install NGINX, which is basically our load balancer and it distributes our 10000 requests among the 4 different servers. Steps to install NGINX and change what to do exactly with NGINX is given below:
<br>
Install NGINX: 
<div align="center">
  <img src="static/INSTALL.png" alt="Install NGINX">
</div>
<br>

Open the config file: 
<div align="center">
  <img src="static/config.png" alt="config">
</div>
<br>

Make sure ur Config file has this instead of the server {} code. Basically replace the entire server {} with this: 
<div align="center">
  <img src="static/nginx.png" alt="nginx">
</div>
<br>

Restart NGINX with: 
<div align="center">
  <img src="static/restart.png" alt="restart">
</div>
<br>

Now in ur Script.sh file, change the URL to : <b>URL="http://127.0.0.1/api/hello?name=Adit"</b>

Then finally run : <b>bash script.sh</b>

<br>
Result: 
<div align="center">
  <img src="static/HS_DEMO_RES.png" alt="HS Output">
</div>

<b>Conclusion: </b> The result is clearly evident and visible. The time taken and the statistics of the time taken for each request to be sent is drastically changed after we increased the workers, ie - Horizontal Scaling. 

### Core differences between Horizontal and Vertical scaling: 
<div align="center">
  <img src="static/HvsS.png" alt="Difference">
</div>
<br> 