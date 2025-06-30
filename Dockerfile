FROM fluent/fluentd:v1.16-1

USER root

# Install required system packages
RUN apk add --no-cache --update build-base ruby-dev musl-dev

# Install plugins without version pins (let RubyGems choose compatible versions)
RUN gem install \
    fluent-plugin-azure-loganalytics \
    fluent-plugin-docker_metadata_filter \
    fluent-plugin-record-modifier \
    --no-document

# Optional: If you really need the parser plugin, use this instead:
# RUN gem install fluent-plugin-parser --version '~> 0.3' --no-document

# Create log directory
RUN mkdir -p /fluentd/log && chown -R fluent /fluentd

USER root
