# Use so you can run in mock mode from the command line
#
# FOG_MOCK=true fog

if ENV["FOG_MOCK"] == "true"
  Fog.mock!
end

# if in mocked mode, fill in some fake credentials for us
if Fog.mock?
  Fog.credentials = {
    :cloudstack_disk_offering_id      => '',
    :cloudstack_host                  => 'http://cloudstack.example.org',
    :cloudstack_network_ids           => '',
    :cloudstack_service_offering_id   => '4437ac6c-9fe3-477a-57ec-60a5a45896a4',
    :cloudstack_template_id           => '8a31cf9c-f248-0588-256e-9dbf58785216',
    :cloudstack_zone_id               => 'c554c592-e09c-9df5-7688-4a32754a4305',
    :cloudstack_project_id            => 'f1f1f1f1-f1f1-f1f1-f1f1-f1f1f1f1f1f1',
  }.merge(Fog.credentials)
end
