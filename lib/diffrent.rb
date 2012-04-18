module Diffrent
  
  # Get a diff between two arbitrary versions of an ActiveRecord object. 
  #
  # @param [Symbol] attr the attribute you want to diff.
  # @param [Integer] old_version the version you want to start your diff at.
  # @param [Integer] new_version the version you want to diff to.
  # @param [Hash] options an options hash allowing you to pass a :format.
  # @return [String] a diff string. If :format was nil, this could be a [Diffy::Diff].
  def diff_for(attr, old_version, new_version, options={:format => :html})
    changes = self.changes_between(new_version, old_version)
    if changes.key?(attr)
      Diffy::Diff.new(changes[attr].first, changes[attr].last).to_s(options[:format])
    else
      self.send(attr)
    end
  end

  # Are there previous versions?
  # @param [Integer] v the version number to check. 
  # @return [Boolean] whether there are any versions before version v.
  def has_versions_before?(v)
    self.versions.at(v - 1)
  end

  # Are there later versions?
  # @param [Integer] v the version number to check. 
  # @return [Boolean] whether there are any versions after version v. 
  def has_versions_after?(v)
    self.versions.at(v + 1)
  end

end