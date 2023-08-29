# Roblox-project-3
Code uit nog een onvoltooid spel voor een lasershow systeem

# Festival Event Play Function

This Lua script contains a function named `PlayFestival` designed to manage and orchestrate festival events within the context of a Roblox game. The function controls lighting effects, music, lasers, and emitters during the festival.

## Function Overview

The `PlayFestival` function performs the following tasks:

1. It takes one argument, `FestivalToPlay`, which specifies the name of the festival to play.

2. The function retrieves preset data, lighting nodes, music tracks, lasers, and emitters associated with the specified festival.

3. It starts playing the festival music using the `Music:Play()` method.

4. The script iterates through the nodes of the festival, controlling lasers and emitters as specified.

5. If a node has a "Repeat" value defined, the function repeats the effects of the node based on the specified count.

6. Laser and emitter effects are created and controlled based on the properties defined in the preset data.

7. The function enforces delays between different festival nodes to control the duration of effects.

8. After completing all festival nodes, the function removes any emitter parts that were created during the festival.

## Usage

1. Copy the `PlayFestival` function from this script.

2. Integrate the function into your Roblox game environment, specifically where you want to initiate festival events.

3. Call the function with the appropriate festival name to start the festival:

   ```lua
   local festivalName = "SummerFestival"
   PlayFestival(festivalName)

   Readme made by ChatGPT
