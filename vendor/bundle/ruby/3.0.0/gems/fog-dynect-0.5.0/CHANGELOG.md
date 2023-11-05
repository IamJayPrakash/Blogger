v0.5.0 2021-04-28
=================

replace deprecated Fog::DNS:Dynect usage with Fog::Dynect::DNS
add github actions and config
drop travis usage

v0.4.0

allow specifying api version
bump API version used to 3.7.13
fix travis tests

v0.3.0

-   Change API endpoint to 'api.dynect.net' as Dyn will decommision
'api-v4.dynect.net'

v0.2.0

populate 'ttl' property of 'record' model

v0.1.0

update to dyn api version 3.7.0
fix comments for ALIAS records
fix ruby 1.8 Gemfile rake version

v0.0.3

fix DNS record updates for fog-core 1.25.0 and later

v0.0.2

extract bin from fog
use autoload to reduce code loaded

v0.0.1

Initial extraction from fog v1.18.0-2712-g388983f.
