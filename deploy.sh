sbt assembly

rm -f Archive.zip
rm -f hello-scala-assembly-1.0.jar

cp target/scala-2.11/hello-scala-assembly-1.0.jar hello-scala-assembly-1.0.jar

zip -r -X Archive.zip run.bat hello-scala-assembly-1.0.jar

curl -i -H "Authorization: Basic $AZURE_PUBLISH_PROFILE" -H "Content-Type:application/zip" -H "Content-Disposition:attachement;filename=Archive.zip" https://jaapem-webjob.scm.azurewebsites.net/api/triggeredwebjobs/run --upload-file Archive.zip 

curl -i -X POST -H "Content-Length: 0" -H "Authorization: Basic $AZURE_PUBLISH_PROFILE" https://jaapem-webjob.scm.azurewebsites.net/api/triggeredwebjobs/run/run

#curl -i -H "Authorization: Basic $AZURE_PUBLISH_PROFILE" https://jaapem-webjob.scm.azurewebsites.net/api/triggeredwebjobs/run