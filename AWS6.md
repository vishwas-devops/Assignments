First need to acquire one done from freenom i.e. vishwasgandhi.cf

Now go to S3 create a bucket with 1 index.html file and host the content of that file by 
going in properties and enable website hosting

Now go to Route 53 create hosted zone there you will get below name server .
Now put these name servers in freenom account also so othat freenom have idea where he need to host the file

ns-1684.awsdns-18.co.uk. 
ns-1316.awsdns-36.org. 
ns-430.awsdns-53.com. 
ns-1001.awsdns-61.net.

Now create the recordset and select A class type and the select aliases there you will get the S3 bucet
link select it and create that recordset.

After some time you will be able to see the same static website of S3