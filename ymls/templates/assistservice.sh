    [Unit]
    Description=Move Service Daemon
    After=multi-user.target

    [Service]
    Type=simple
    User=root
    Group=root
    ExecStart=/bin/bash /pg/data/blitz/assist.sh
    TimeoutStopSec=20
    KillMode=process
    RemainAfterExit=yes
    Restart=always

    [Install]
    WantedBy=multi-user.target
