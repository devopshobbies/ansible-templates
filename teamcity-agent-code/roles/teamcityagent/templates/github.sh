#!/bin/bash
exec /usr/bin/ssh -o StrictHostKeyChecking=no -i ~/.ssh/github "$@"
