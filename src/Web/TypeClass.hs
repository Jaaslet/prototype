{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DefaultSignatures #-}
module TypeClass where

import Data.Data
import Data.Proxy
import GHC.Generics
import CodeGen.DataGen
import Contract

{-
class CGUIRep a where
    toForm :: Proxy (Rep a) -> [(String, TypeRep)]
    default toForm :: (Generic a, GUIRep a) => Proxy a -> [(String, TypeRep)]
    toForm = gtoForm
-}

class PricerInput a where
    makeInput :: a -> IO ([(DiscModel, ModelData, MarketData)], MContract)

class GUIRep f where
    gtoForm :: Proxy f  -> [(String, TypeRep)]

instance (GUIRep a, GUIRep b) => GUIRep (a :*: b) where
    gtoForm _ = gtoForm (Proxy :: Proxy a) ++ gtoForm (Proxy :: Proxy b)

instance (Selector s, Typeable t) => GUIRep (M1 S s (K1 R t)) where
    gtoForm _ = [(selName (undefined :: M1 S s (K1 R t) ()), typeOf (undefined :: t))]

instance (GUIRep f) => GUIRep (M1 D x f) where
    gtoForm _ = gtoForm (Proxy :: Proxy f)

instance (GUIRep f) => GUIRep (M1 C x f) where
    gtoForm _ = gtoForm (Proxy :: Proxy f)