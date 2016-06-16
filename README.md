# Kavenegar

## What is Kavenegar?
[Kavenegar](http://kavenegar.com) is an api endpoint to send and receive Text messages through your application. This Module lets you do that in Elixir.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add kavenegar to your list of dependencies in `mix.exs`:

        def deps do
          [{:kavenegar, "~> 0.0.1"}]
        end

  2. Ensure kavenegar is started before your application:

        def application do
          [applications: [:kavenegar]]
        end

## How to use?

It's really simple. Just call the method you want with it's parameters as a Map in %{}. The response will be in Map.

```elixir
Kavenegar.send %{receptor: "+989123456789", message: "this is a sample text"}
```
will return:
```elixir
%{"entries" => [%{"cost" => 130, "date" => 1466091791,
     "message" => "this is a sample text", "messageid" => 999999999,
     "receptor" => "+989123456789", "sender" => "10001000010000", "status" => 1,
     "statustext" => "در صف ارسال"}],
  "return" => %{"message" => "تایید شد", "status" => 200}}
```

## Available methods:
check out the [Documentaions](http://kavenegar.com/Rest.html) for available methods.

This is my first Elixir application. So please suggest how to make it better. Thanks!
