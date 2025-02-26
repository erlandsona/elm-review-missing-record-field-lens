module ReviewConfig exposing (config)

{-| Do not rename the ReviewConfig module or the config function, because
`elm-review` will look for these.

To add packages that contain rules, add them to this review project using

    `elm install author/packagename`

when inside the directory containing this file.

-}

import Review.Rule as Rule exposing (Rule)
import VariantPrism.GenerateUsed

config : List Rule
config =
    [ { name = VariantPrism.GenerateUsed.prismNameOnVariant
      , build = VariantPrism.GenerateUsed.accessors
      }
        |> VariantPrism.inVariantOriginModuleDotSuffix
            "Extra.Local"
        |> VariantPrism.importGenerationModuleAsOriginModule
        |> VariantPrism.GenerateUsed.rule
    ]
