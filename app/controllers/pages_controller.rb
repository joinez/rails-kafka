# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    event = {
      ip: request.ip,
      path: request.path,
      browser: request.env["HTTP_USER_AGENT"]
    }
    $kafka_producer.produce(event.to_json, topic: "page_visits")
  end

  def messages
  end
end
