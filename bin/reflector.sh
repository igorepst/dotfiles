#!/bin/sh
reflector --country 'Israel' --country 'Italy' --country 'Greece' --country 'Germany' --ipv4 --protocol http --protocol https --sort rate $@

