# http://emberjs.com/guides/models/using-the-store/

Foodlog.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  adapter: DS.ActiveModelAdapter.reopen
    namespace: 'api'
