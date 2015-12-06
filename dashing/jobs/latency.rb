require 'net/http'
require 'json'

# TODO : read from tcp connection
@latencies = [{topic: "topic 1", partition: 0, latency: 5000}]

def FindLatency(topic, partition) do
    latency = nil
    @latencies.each do |lat|
        if (lat["topic"] == name and lat["partition"] == partition)
            latency = lat
        end
    end
end


def GetLatencies() do
    url = 'http://192.168.33.10'
    resp = Net::HTTP.get_response(URI.parse(url))
    currentLatencies = JSON.Parse(resp.body)
end

def UpdateLatencies do
    currentLatencies = GetLatencies()
    unless (currentLatencies.nil?)
        currentLatencies.each { |curr|
            currentLatency = FindLatency(curr['topic'], curr['partition']);
            if (currentLatency.nil?)
                @latencies << curr
            else
                currentLatency['latency'] = curr['latency']
            end
        }
    end
end



SCHEDULER.every '2s' do
    send_event('latency', { consumer: "consumer 1", items: latencies  })
end
