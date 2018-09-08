# frozen_string_literal: true

require "kafka"

$kafka = Kafka.new(["kafka:9092", "kafka2:9092"], logger: Rails.logger)

$kafka_producer = $kafka.async_producer(
  delivery_interval: 10,
)

at_exit { $kafka_producer.shutdown }

# $kafka_consumer = $kafka.consumer(group_id: "my-consumer")
# $kafka_consumer.subscribe("page_visits")
# trap("TERM") { $kafka_consumer.stop }

# $kafka_consumer.each_message do |message|
#   Rails.logger.info message
# end
