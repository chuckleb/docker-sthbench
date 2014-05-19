Based off of ServeTheHome STHbench 2013 instructions, image contains all updates and automatically runs the test script.

http://forums.servethehome.com/index.php?resources/sthbench-2013-download-and-instructions.7/

To run:

Make sure Docker is installed:  
http://docs.docker.io/installation/#installation  

To run the benchmark, we pull the latest copy and then pass a directory to store results.  
<pre><code>
docker pull chuckleb/sthbench  
docker run -v `pwd`:/data chuckleb/sthbench
</code></pre>
