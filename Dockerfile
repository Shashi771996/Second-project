pipeline {
    agent any

    stages {
        stage('Download date from github account') {
            steps {
                git branch: 'main', url: 'https://github.com/Shashi771996/Second-project.git'
            }
        }
    stage('Transfer data from jenkins to ansible machine ') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Jenkins-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'rsync ssh -e /var/lib/jenkins/workspace/Second-project/Dockerfile root@3.133.146.82:/var/www/html', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
           }
        }
    }
}

