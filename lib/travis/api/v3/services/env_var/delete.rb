module Travis::API::V3
  class Services::EnvVar::Delete < Service
    params :id, prefix: :repository
    params :id, prefix: :env_var

    def run!
      raise LoginRequired unless access_control.logged_in? or access_control.full_access?
      raise NotFound      unless repository = find(:repository)
      query.delete(repository)
    end
  end
end
