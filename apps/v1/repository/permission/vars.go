package permission

var (
	RepoPermission         iPermissionRepository         = new(permissionRepo)
	RepoPermissionSubclass iPermissionSubclassRepository = new(permissionSubclassRepo)
)
