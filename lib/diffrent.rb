module Diffrent
  
  def diff_for(attr, old_version, new_version, options={:format => :html})
    changes = self.changes_between(new_version, old_version)
    if changes.key?(attr)
      Diffy::Diff.new(changes[attr].first, changes[attr].last).to_s(options[:format])
    else
      self.send(attr)
    end
  end

  def has_versions_before?(v)
    self.versions.at(v - 1)
  end

  def has_versions_after?(v)
    self.versions.at(v + 1)
  end

end