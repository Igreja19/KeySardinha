<?php

$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'aDEKGGQCbAPZk5vM_Wz-mqoFRqldvH4y',
        ],
    ],
];

// Só ativa debug e gii em ambiente de desenvolvimento
if (getenv('YII_ENV') === 'dev' || defined('YII_ENV_DEV') && YII_ENV_DEV) {
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => \yii\debug\Module::class,
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => \yii\gii\Module::class,
    ];
}

return $config;