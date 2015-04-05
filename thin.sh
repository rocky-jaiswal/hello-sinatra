#!/bin/bash

cd /home/app/hello-sinatra
exec chpst -u app:app ./bin/thin -R ./config.ru start >>/var/log/thin.log 2>&1

