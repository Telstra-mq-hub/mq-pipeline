pipeline {
    agent any
    environment {
        IBM_ENTITLEMENT_KEY = credentials('ibm_entitlement_key')
        RELEASE_NAME        = "qm-demo-2"        
        NAMESPACE           = "mq"
        STORAGE_CLASS       = "ocs-storagecluster-cephfs"
        QMGR_NAME           = "QM1"
        CHANNEL_NAME        = "QM1CHL"
        LICENSE             = "L-RJON-CD3JKX"
        METRIC              = "VirtualProcessorCore"
        USE                 = "NonProduction"
        VERSION             = "9.3.0.0-r1"
        AVAILABILITY        = "SingleInstance"
    }
    stages {
        stage('Pre Deploy') {
            steps {
                echo 'Pre-Deploy ~ setup configuration before deploy'
                sh('./scripts/01-pre-deploy.sh ${IBM_ENTITLEMENT_KEY} ${RELEASE_NAME} ${NAMESPACE}')
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy ~ deploy queue manager'
                sh('./scripts/02-deploy.sh ${RELEASE_NAME} ${NAMESPACE} ${STORAGE_CLASS} ${QMGR_NAME} ${CHANNEL_NAME} ${LICENSE} ${METRIC} ${USE} ${VERSION} ${AVAILABILITY}')
            }
        }
        // stage('Post-Deploy') {
        //     steps {
        //         echo 'Post-Deploy'
        //         sh('./scripts/03-post-deploy.sh ${RELEASE_NAME} ${NAMESPACE}')
        //     }
        // }
        // stage('uninstall') {
        //     steps {
        //         echo 'Uninstall queue manager'
        //         sh('./scripts/04-uninstall.sh ${RELEASE_NAME} ${NAMESPACE}')
        //     }
        // }
    }
}
