# GenMagic.Pool

Reliability and scalability pool for [gen_magic](https://github.com/evadne/gen_magic), based on [nimble_pool](https://github.com/dashbitco/nimble_pool).

## Installation

```elixir
def deps do
  [
    {:gen_magic, "~> 1.0"},
    {:gen_magic_pool, "~> 0.1.0"}
  ]
end
```

## Usage

Define a pool in your application supervisor by adding it as a child:

```
    children =
      [
        # ...
        {GenMagic.Pool, [name: YourApp.GenMagicPool]}
      ]

    opts = [strategy: :one_for_one, name: YourApp.Supervisor]
    Supervisor.start_link(children, opts)
```

And then you can use it with `GenMagic.Pool.perform/2`:

```
iex(1)> GenMagic.Pool.perform(YourApp.GenMagicPool, Path.expand("~/.bash_history"))
{:ok, %GenMagic.Result{mime_type: "text/plain", encoding: "us-ascii", content: "ASCII text"}}
```

By default, a `GenMagic.Server` worker will be started for every online scheduler.

