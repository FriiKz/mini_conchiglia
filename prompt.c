/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   prompt.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbusi <lbusi@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/10 17:02:33 by aperez-b          #+#    #+#             */
/*   Updated: 2023/05/01 15:27:06 by lbusi            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

extern int	g_status;

char	*mini_getprompt(t_prompt prompt)
{
	char	*temp;
	char	*temp2;

	(void)prompt.envp;
	temp2 = ft_strjoin(NULL, "minishell> ");
	temp = ft_strjoin(temp2, NULL);
	free(temp2);
	if (!g_status || g_status == -1)
		temp2 = ft_strjoin(temp, DEFAULT);
	else
		temp2 = ft_strjoin(temp, DEFAULT);
	free(temp2);
	temp2 = ft_strjoin(temp, DEFAULT);
	free(temp);
	return (temp2);
}
