class CarDekho
    def fetch
        url = "http://localhost:3000/posts"
        response = RestClient.get(url,headers = {})
    end

    def create
        url = "http://localhost:3000/posts"
        body = {
            post: {
                title: "this is form rest clind",
                description: "this id",
                category_id: 1
            }
        }

        headers = {
            Authorization: "Bearer eyJhY2Nlc3MtdG9rZW4iOiIzanN6WktNOWgzeGI1M294akRWSU9RIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6Ik4xWE5GbTUtRDByOUVFT0s3YkpNelEiLCJleHBpcnkiOiIxNjc4MDg0ODM1IiwidWlkIjoidGVzdDFAZW1haWwuY29tIn0="
        }

        begin
            response = RestClient.post(url,body,headers)
        rescue => e
            e.message
        end
    end

end