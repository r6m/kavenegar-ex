defmodule Kavenegar do
  @headers [{"Content-Type", "application/json;charset=utf-8"}]
  @api_key Application.get_env(:kavenegar, :api_key)
  @base_url "https://api.kavenegar.com/v1"

  def url, do: "#{@base_url}/#{@api_key}/"
  def url_for(type, point), do: url <> type <> "/#{point}.json"

  ~w(send sendarray status statuslocalmessageid select selectoutbox latestoutbox countoutbox cancel receive countinbox countpostalcode sendbypostalcode)
  |> Enum.each( fn endpoint ->
    def unquote(String.to_atom(endpoint))(args \\ %{}) do
      HTTPoison.get(url_for("sms", unquote(endpoint)), @headers, params: args)
      |> handle_response
    end
  end)

  ~w(info config)
  |> Enum.each( fn endpoint ->
    def unquote(String.to_atom(endpoint))(args \\ %{}) do
      HTTPoison.get(url_for("account", unquote(endpoint)), @headers, params: args)
      |> handle_response
    end
  end)


  ~w(lookup)
  |> Enum.each( fn endpoint ->
    def unquote(String.to_atom(endpoint))(args \\ %{}) do
      HTTPoison.get(url_for("verify", unquote(endpoint)), @headers, params: args)
      |> handle_response
    end
  end)

  defp handle_response({:error, %{reason: :timeout}}) do
    {:error, message: "time out"}
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    Poison.decode!(body)
  end

  defp handle_response({:ok, %{status_code: _status, body: body}}) do
    Poison.decode!(body)
  end

end
