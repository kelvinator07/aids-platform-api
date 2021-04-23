class ResetAllRequestCacheCounters < ActiveRecord::Migration[6.0]
  def up

    Request.all.each do |request|

      Request.reset_counters(request.id, :responses)

     end

  end

  def down

     # no rollback needed

  end
end
