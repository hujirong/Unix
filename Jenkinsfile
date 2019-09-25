pipeline {
  agent any
  stages {
    stage('Build') {
      steps {   
        echo 'branch name ' + env.BRANCH_NAME
        if (env.BRANCH_NAME.startsWith("DEV")) {
            echo "Deploying to DEV"
        } else if (env.BRANCH_NAME.startsWith("TST")) {
            echo "Deploying to TST"
        } else if (env.BRANCH_NAME.startsWith("PAT")) {
            echo "Deploying to PAT"
        } else if (env.BRANCH_NAME.startsWith("PRD")) {
            echo "Deploying to PRD"
        } else if (env.BRANCH_NAME.startsWith("master")) {
            echo "merge to master"
        }
      }
    }
  }
}
