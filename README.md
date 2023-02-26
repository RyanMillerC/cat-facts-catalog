# Cat Facts OLM Catalog

Install Cat Facts Operator on OpenShift through Operator Lifecycle Manager
(OLM). This repo contains code to build an OLM *file-based catalog* that
includes the bundle for the Cat Facts Operator.

## How to Use this Catalog in OpenShift

Create this object:

```yaml
apiVersion: operators.coreos.com/v1alpha1
kind: CatalogSource
metadata:
  name: cat-facts-catalog
  namespace: openshift-marketplace
spec:
  sourceType: grpc
  image: quay.io/rymiller/cat-facts-catalog:latest
  displayName: Cat Facts Catalog
  publisher: Ryan Miller
  updateStrategy:
    registryPoll:
      interval: 10m
```

## Acknowledgments

Cat emoji used for catalog icon was created by Emily Jäger, licensed under
[CC BY-SA 4.0] and is [available here][cat-emoji].

[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0
[cat-emoji]: https://openmoji.org/library/emoji-1F638
