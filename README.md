# Flux Constraint Engine

INT8 constraint checking with severity thresholds. Pure Ruby, no dependencies.

## Install

```bash
gem install flux-constraint
```

Or in your Gemfile:

```ruby
gem 'flux-constraint'
```

## Quick Start

```ruby
require 'flux-constraint'

checker = Flux::ConstraintChecker.new([
  Flux::ConstraintRule.new('temperature', 20, 120, 60, 80, 100),
  Flux::ConstraintRule.new('pressure', 10, 200, 80, 120, 180),
])

result = checker.check('temperature' => 75, 'pressure' => 90)
puts result.passed    # => true
puts result.severity   # => Flux::PASS

# Violation
result = checker.check('temperature' => 110, 'pressure' => 50)
puts result.passed    # => false
puts result.severity  # => Flux::WARNING
puts result.violations  # => [{rule: 'temperature', value: 110, severity: 2}]
```

## INT8 Saturation

Values outside [-127, 127] are saturated (clamped), not wrapped:

```ruby
checker = Flux::ConstraintChecker.new([
  Flux::ConstraintRule.new('test', -10, 10, 5, 8, 10),
])

result = checker.check('test' => 200)  # 200 → 127 (saturated)
puts result.passed  # => false — hit critical threshold
```

## Industry Presets

```ruby
preset = Flux::IndustryPreset.for(:automotive)
checker = Flux::ConstraintChecker.new(preset.rules)
```

Available presets: `:automotive`, `:medical`, `:aerospace`, `:industrial`

## License

MIT
