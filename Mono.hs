{-# LANGUAGE Rank2Types #-}
module Mono where

-- Claim: using this interface (meaning excluding the constructors),
-- there is no term we can form, such that a subterm (other than undefined) has type 
-- type (forall x. Mono s (f x)) where f is some type function. 

-- This implies that there is cannot be a subterm of type
-- (forall x. Mono x). This is the reason that STRefs (and IORefs) 
-- are type-safe: references are monomorphic.

data Mono s a = Mono -- constructor not exported

newtype MonoM s a = MonoM a -- constructor not exported

newMono :: MonoM s (Mono s a)
newMono = MonoM Mono

runMono :: (forall s. MonoM s a) -> a
runMono (MonoM x) x



