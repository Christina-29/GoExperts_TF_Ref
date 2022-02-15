[
  {
    "name": "${name}",
    "image": "${image}",
    "cpu": ${cpu},
    "memory": ${memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${container_port},
        "protocol": "tcp",
        "hostPort": 0
      }
    ],
    "environmentFiles": [
        {
          "value": "${environmentFiles}",
          "type": "s3"
        }
      ]
  }
]
