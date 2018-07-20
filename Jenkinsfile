node {
  def registryHost = "registry.pjsy.com:4433"


  stage('Checkout') {
      checkout scm
  }

  stage('Build') {
      docker.image('maven').inside("-v /root/.m2:/root/.m2") {
        sh "mvn clean package -Dmaven.test.skip=true -U"
      }
  }

  stage('ArchiveArtifacts') {
      archiveArtifacts '**/*.tar.gz'
  }

  stage('BuildAndPushImages') {
    withEnv(["ENV_REGISTRY_HOST=${registryHost}"]) {
      sh "docker login -u admin -p '&t!hjF65%DXvnYCc' ${env.ENV_REGISTRY_HOST}"
      sh "cd ${env.WORKSPACE}/devops && chmod +x ./build.sh && ./build.sh"
      sh "cd ${env.WORKSPACE}/devops && chmod +x ./build.sh && ./build.sh"
    }
  }

  stage('Deploy') {
    withEnv(["ENV_REGISTRY_HOST=${registryHost}"]) {
      sh "cd ${env.WORKSPACE}/devops && chmod +x ./deploy.sh && ./deploy.sh"
      sh "cd ${env.WORKSPACE}/devops && chmod +x ./deploy.sh && ./deploy.sh"
    }
  }
}
