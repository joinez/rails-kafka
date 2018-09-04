# frozen_string_literal: true

require "kafka"

KAFKA = Kafka.new(["kafka:9092"], client_id: "rails-app")
