class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @stats = current_user.stats.where('option_type = ? and period_starting > ?', "day",  1.month.ago ).map{ |rc| [  rc.period_starting.strftime('%m/%d/%Y'), rc.distinct_identities ] }
  end

  def logs
    @authentication_logs = []
  end

end
