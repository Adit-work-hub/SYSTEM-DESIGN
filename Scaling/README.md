# Scaling
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
  <img src="static/CS_Arch.png" alt="Support Image">
</div>

<br>
As the nummber of users increase, the server gets more requests, which can cause overload on the server. Scaling helps the server handle more clients without downtime or slow performance.