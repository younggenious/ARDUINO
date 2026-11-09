# ARDUINO · Virtual Circuit Lab

A browser based virtual Arduino experiment playground. It runs without a physical board.

## Features

- Arduino UNO R3 and MEGA 2560 board views with their digital and analog pin sets.
- Freeform circuit layout: add LED, resistor, push button, potentiometer, photoresistor, buzzer, servo, ultrasonic sensor, DC motor, and LCD parts; drag them around and connect terminals with wires.
- Starter experiments: LED blink, button input, light sensor, distance sensor, and servo.
- Editable Arduino C++ examples, local browser save, and public experiment sharing through Supabase.
- Responsive single page app with no build step.

## Run locally

Open `index.html` in a modern browser. Sharing needs internet access and the configured Supabase project.

## Sharing and database

`supabase-schema.sql` creates `public.arduino_experiments` with row-level security. Anyone can read and submit experiments; public edits and deletes are not granted. Shared circuit drawings, code, names, and descriptions are public. The browser uses a publishable Supabase key; never add a service-role key here.

## Simulation scope

The canvas lets you freely draw and wire circuits and switch between UNO and MEGA pin layouts. The current runtime is a learning preview, not a full Arduino compiler or SPICE/electronics engine: its executable visual feedback currently recognizes basic `digitalWrite(..., HIGH)` and `delay(...)` LED blink code. Other starter sketches are provided for learning and can be edited/shared, but their physical behavior is not modeled yet.

## Deploy

The included GitHub Actions workflow publishes the repository root to GitHub Pages on pushes to `main` and on manual runs.

