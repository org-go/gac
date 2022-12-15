package role

var (
	RepoRole         iRoleRepository         = new(roleRepo)
	RepoRoleSubclass iRoleSubclassRepository = new(roleSubclassRepo)
)
