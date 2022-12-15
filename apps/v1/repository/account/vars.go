package account

var (
	// RepoAccountAdmin 内部账号
	RepoAccountAdmin iAccoutAdminRepostory = new(adminRepo)
	// RepoAcctProvd 服务商账号
	RepoAcctProvd iAccoutProvdRepostory = new(providerRepo)
	// RepoAcctProvdProfile 服务商账号profile
	RepoAcctProvdProfile iAccoutProvdProfile = new(acctProviderProfileRepo)
)

var (
	// RepoAccount sso 账户
	RepoAccount iAccountRepostory = new(accountRepo)
	// RepoSubclass sso 子账户
	RepoSubclass iAccountSubclassRepository = new(serviceSubclassRepo)
)
